_.extend Meteor,

  define: (className, data) ->

    Constructor = @_makeCtor()

    data.$className = className

    if data.__proto__.hasOwnProperty 'statics'
      _.extend global, data.__proto__.statics

    global = @_setNamespace(className, data)

    global = data


  create: (Class, config) ->

    if Class.singleton

      if Class._instance
        return Class._instance

    instance = new -> Class

    if instance.extends
      Class = _.extend eval(instance.extends)(), Class

    instance.constructor()
    instance._instance = instance

    instance


  extend: (SuperClass, Class) ->

    construct                   = ->
    construct.prototype         = SuperClass.prototype

    Class = Class or {}

    Class.prototype             = new construct;
    Class.prototype.constructor = Class;
    Class._super                = SuperClass;

    Class


  _makeCtor: () ->
    constructor = () ->
  #   Opera has some problems returning from a constructor when Dragonfly isn't running. The || null seems to
  #   be sufficient to stop it misbehaving. Known to be required against 10.53, 11.51 and 11.61.
      @.constructor.apply(@, arguments) || null

    constructor


  namespaceRewrites: [
    from: 'Meteor.'
    to  : Meteor
  ]

  enableNamespaceParseCache: true
  namespaceParseCache: {}


  ###
    Supports namespace rewriting
    @private
  ###
  _parseNamespace: (namespace) ->
    if typeof namespace isnt 'string'
      throw new Error "[Meteor.parseNamespace] Invalid namespace, must be a string"

    cache = @namespaceParseCache

    if @enableNamespaceParseCache
      if cache.hasOwnProperty namespace
        return cache[namespace]

    parts     = []
    rewrites  = @namespaceRewrites
    root      = Meteor
    name      = namespace

    for rewrite in rewrites
      from    = rewrite.from
      to      = rewrite.to

      if name is from or name.substring(0, from.length) is from
        name = name.substring from.length

        if typeof to isnt 'string'
          root = to
        else
          parts = parts.concat to.split '.'

        break

    parts.push root

    parts = parts.concat name.split '.'

    if @enableNamespaceParseCache
      cache[namespace] = parts

    parts


  ###
    Creates a namespace and assign the `value` to the created object

      Ext.ClassManager.setNamespace('MyCompany.pkg.Example', someObject);

      alert(MyCompany.pkg.Example === someObject); // alerts true

    @param {String} name
    @param {Object} value
  ###
  _setNamespace: (name, value) ->
    root  = Meteor
    parts = @_parseNamespace name
    ln    = parts.length - 1
    leaf  = parts[ln]

    for part in parts

      if typeof part isnt 'string'
        root = part
      else
        if not root[part]
          root[part] = {}

        if _i isnt _len - 1
          root = root[part]

    root[leaf] = value

    root[leaf]