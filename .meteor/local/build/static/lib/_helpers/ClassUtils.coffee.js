
_.extend(Meteor, {
  define: function(className, data) {
    var Constructor, global;
    Constructor = this._makeCtor();
    data.$className = className;
    if (data.__proto__.hasOwnProperty('statics')) {
      _.extend(global, data.__proto__.statics);
    }
    global = this._setNamespace(className, data);
    return global = data;
  },
  create: function(Class, config) {
    var instance;
    if (Class.singleton) {
      if (Class._instance) {
        return Class._instance;
      }
    }
    instance = new function() {
      return Class;
    };
    if (instance["extends"]) {
      Class = _.extend(eval(instance["extends"])(), Class);
    }
    instance.constructor();
    instance._instance = instance;
    return instance;
  },
  extend: function(SuperClass, Class) {
    var construct;
    construct = function() {};
    construct.prototype = SuperClass.prototype;
    Class = Class || {};
    Class.prototype = new construct;
    Class.prototype.constructor = Class;
    Class._super = SuperClass;
    return Class;
  },
  _makeCtor: function() {
    var constructor;
    constructor = function() {
      return this.constructor.apply(this, arguments) || null;
    };
    return constructor;
  },
  namespaceRewrites: [
    {
      from: 'Meteor.',
      to: Meteor
    }
  ],
  enableNamespaceParseCache: true,
  namespaceParseCache: {},
  /*
      Supports namespace rewriting
      @private
  */

  _parseNamespace: function(namespace) {
    var cache, from, name, parts, rewrite, rewrites, root, to, _i, _len;
    if (typeof namespace !== 'string') {
      throw new Error("[Meteor.parseNamespace] Invalid namespace, must be a string");
    }
    cache = this.namespaceParseCache;
    if (this.enableNamespaceParseCache) {
      if (cache.hasOwnProperty(namespace)) {
        return cache[namespace];
      }
    }
    parts = [];
    rewrites = this.namespaceRewrites;
    root = Meteor;
    name = namespace;
    for (_i = 0, _len = rewrites.length; _i < _len; _i++) {
      rewrite = rewrites[_i];
      from = rewrite.from;
      to = rewrite.to;
      if (name === from || name.substring(0, from.length) === from) {
        name = name.substring(from.length);
        if (typeof to !== 'string') {
          root = to;
        } else {
          parts = parts.concat(to.split('.'));
        }
        break;
      }
    }
    parts.push(root);
    parts = parts.concat(name.split('.'));
    if (this.enableNamespaceParseCache) {
      cache[namespace] = parts;
    }
    return parts;
  },
  /*
      Creates a namespace and assign the `value` to the created object
  
        Ext.ClassManager.setNamespace('MyCompany.pkg.Example', someObject);
  
        alert(MyCompany.pkg.Example === someObject); // alerts true
  
      @param {String} name
      @param {Object} value
  */

  _setNamespace: function(name, value) {
    var leaf, ln, part, parts, root, _i, _len;
    root = Meteor;
    parts = this._parseNamespace(name);
    ln = parts.length - 1;
    leaf = parts[ln];
    for (_i = 0, _len = parts.length; _i < _len; _i++) {
      part = parts[_i];
      if (typeof part !== 'string') {
        root = part;
      } else {
        if (!root[part]) {
          root[part] = {};
        }
        if (_i !== _len - 1) {
          root = root[part];
        }
      }
    }
    root[leaf] = value;
    return root[leaf];
  }
});
